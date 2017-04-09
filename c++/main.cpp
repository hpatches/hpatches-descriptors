#include <opencv2/opencv.hpp>
#include <string>
#include <iostream>
#include <sstream>
#include <fstream>
#include <boost/filesystem.hpp>
#include <boost/algorithm/string.hpp>

using namespace boost::filesystem;

int main(int argc, char *argv[])
{
  // get all the sequences
  std::string descr_name = "sigmami";
  std::string p = "../../hpatch-release/";
  std::vector<std::string> seqs; 
  if(is_directory(p)) {
    for(auto& entry : boost::make_iterator_range(directory_iterator(p), {}))
      {
	seqs.push_back(entry.path().string());
      }
  }
  
  for(auto const& sq: seqs) {
    std::vector<std::string> imgs;

    std::vector<std::string> seq_splits;
    boost::split(seq_splits, sq, boost::is_any_of("/"));
    std::string seq_name = seq_splits.back();
    boost::filesystem::path dir(descr_name+"/"+seq_name);
    boost::filesystem::create_directories(dir);

    for(auto& entry : boost::make_iterator_range(directory_iterator(sq), {}))
      {
	std::string fname = entry.path().string();
	std::string ext  = boost::filesystem::extension(fname);
	if (ext==".png")
	  {
	    std::cout << "Extracting descriptors for " << fname << std::endl; 
	    // read the image
	    cv::Mat im;
	    im = cv::imread(fname, 0);

	    // get the type name (e.g.ref,e1,e2 etc.)
	    std::vector<std::string> strs;
	    boost::split(strs, fname, boost::is_any_of("/"));
	    std::string img_name = strs.back();
	    std::vector<std::string> strs_;
	    boost::split(strs_, img_name, boost::is_any_of("."));
	    std::string tp =  strs_[0];

	    //open the descriptor file for saving
	    std::ofstream f;
	    f.open(descr_name+"/"+seq_name+"/"+tp+".csv");

	    //loop through each patch
	    for (int r = 0; r < im.rows; r += 65)
	      {
		cv::Mat patch = im(cv::Range(r, r + 65),
				   cv::Range(0, 65));
		// replace the following part with
		// your descriptor computation method 
		cv::Scalar mi, sigma;
		cv::meanStdDev (patch, mi, sigma );
		//save the descriptor as a single csv row 
		f << mi[0] << "," << sigma[0] << std::endl;
	      }
	    f.close();
	  }
      }
  }
  return 0;
}
